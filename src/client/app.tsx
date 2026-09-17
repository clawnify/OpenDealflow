import { AppNav, embedded } from "@clawnify/app/client";
import { useCrmState } from "./hooks/use-crm";
import { CrmContext } from "./context";
import { useRouter } from "./hooks/use-router";
import { Sidebar } from "./components/sidebar";
import { ErrorBanner } from "./components/error-banner";
import { TooltipProvider } from "./components/ui/tooltip";
import { ContactsPage } from "./components/contacts/contacts-page";
import { ContactDetail } from "./components/contacts/contact-detail";
import { CompaniesPage } from "./components/companies/companies-page";
import { DealsBoard } from "./components/deals/deals-board";
import { PropertiesPage } from "./components/properties/properties-page";

export function App() {
  const isAgent = document.documentElement.hasAttribute("data-agent");
  const state = useCrmState(isAgent);
  const { route, navigate } = useRouter();
  const activeKey = route.name === "contact" ? "contacts" : route.name;

  return (
    <CrmContext.Provider value={state}>
    <TooltipProvider delayDuration={200}>
      <div className="flex h-screen min-h-0 flex-col overflow-hidden bg-background text-foreground md:flex-row">
        {embedded ? (
          // Inside the Clawnify dashboard the sections live in its sidebar.
          <AppNav
            title="OpenDealflow"
            icon="users"
            active={activeKey}
            groups={[
              { items: [
                { id: "contacts", label: "People", icon: "users", href: "/contacts", home: true },
                { id: "companies", label: "Companies", icon: "building-2", href: "/companies", count: state.stats.companies },
                { id: "deals", label: "Deals", icon: "dollar-sign", href: "/deals", count: state.stats.deals },
              ] },
              { label: "Settings", items: [
                { id: "properties", label: "Attributes", icon: "settings", href: "/settings/properties" },
              ] },
            ]}
            onNavigate={(item) => navigate(item.href!)}
          />
        ) : (
          <Sidebar route={route} navigate={navigate} />
        )}
        <main className="flex min-w-0 flex-1 flex-col overflow-hidden">
          {state.loading ? (
            <div className="flex flex-1 items-center justify-center text-sm text-muted-foreground">Loading…</div>
          ) : (
            <>
              {route.name === "contacts" && <ContactsPage navigate={navigate} />}
              {route.name === "contact" && <ContactDetail id={route.id} navigate={navigate} />}
              {route.name === "companies" && <CompaniesPage />}
              {route.name === "deals" && <DealsBoard />}
              {route.name === "properties" && <PropertiesPage />}
              {route.name === "not-found" && (
                <div className="flex flex-1 flex-col items-center justify-center gap-2 p-12 text-center">
                  <h1 className="text-xl font-bold tracking-tight">Not found</h1>
                  <p className="text-sm text-muted-foreground">That page doesn't exist.</p>
                  <button className="text-sm text-[var(--ring)] hover:underline" onClick={() => navigate("/contacts")}>
                    Back to contacts
                  </button>
                </div>
              )}
            </>
          )}
        </main>
        <ErrorBanner />
      </div>
    </TooltipProvider>
    </CrmContext.Provider>
  );
}
