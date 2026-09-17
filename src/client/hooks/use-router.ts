import { useState, useEffect, useCallback } from "react";
import { reportLocation } from "@clawnify/app/client";

export type Route =
  | { name: "contacts" }
  | { name: "contact"; id: string }
  | { name: "companies" }
  | { name: "deals" }
  | { name: "properties" }
  | { name: "not-found" };

function parse(path: string): Route {
  if (path === "/" || path === "/contacts") return { name: "contacts" };
  const m = path.match(/^\/contacts\/([^/]+)$/);
  if (m) return { name: "contact", id: decodeURIComponent(m[1]) };
  if (path === "/companies") return { name: "companies" };
  if (path === "/deals") return { name: "deals" };
  if (path === "/settings/properties") return { name: "properties" };
  return { name: "not-found" };
}

export function useRouter() {
  const [path, setPath] = useState<string>(() => window.location.pathname);

  const navigate = useCallback((to: string) => {
    if (to === window.location.pathname) return;
    window.history.pushState(null, "", to);
    setPath(to);
  }, []);

  useEffect(() => {
    const handler = () => setPath(window.location.pathname);
    window.addEventListener("popstate", handler);
    return () => window.removeEventListener("popstate", handler);
  }, []);

  // Tell the Clawnify dashboard where we are, so a reload reopens this screen.
  useEffect(() => {
    reportLocation(window.location.pathname + window.location.search);
  }, [path]);

  return { path, route: parse(path), navigate };
}

/**
 * The record open in a page's preview panel, kept in the query string so a
 * reload (and the dashboard's restored URL) reopens it. Returns the id from the
 * URL and a setter that rewrites it in place.
 */
export function useSelectedParam(name: string): [string | null, (id: string | null) => void] {
  const [value, setValue] = useState<string | null>(() => new URLSearchParams(window.location.search).get(name));
  const update = useCallback((id: string | null) => {
    const url = new URL(window.location.href);
    if (id) url.searchParams.set(name, id);
    else url.searchParams.delete(name);
    window.history.replaceState(null, "", url);
    setValue(id);
    reportLocation(url.pathname + url.search);
  }, [name]);
  return [value, update];
}
