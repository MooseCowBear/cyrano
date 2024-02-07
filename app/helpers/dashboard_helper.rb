module DashboardHelper
  def tab_classes(tab, active_tab)
    if tab == active_tab
      "rounded-t-md tracking-wider text-center sm:py-1 bg-seafoam-100 text-neutral-50"
    else
      "rounded-t-md tracking-wider text-center sm:py-1 bg-neutral-100 border-x border-t border-neutral-300"
    end
  end
end
