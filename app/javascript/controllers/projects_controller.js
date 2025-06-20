import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="projects"
export default class extends Controller {
  static targets = ["sortOption", "sortType"]

  sortChanged() {
    const option = this.sortOptionTarget.value
    const type = this.sortTypeTarget.value

    const url = new URL(window.location.href)
    url.searchParams.set("sort_option", option)
    url.searchParams.set("sort_type", type)
    url.searchParams.set("page", 1)

    Turbo.visit(url.toString(), { action: "replace" })
  }
}
