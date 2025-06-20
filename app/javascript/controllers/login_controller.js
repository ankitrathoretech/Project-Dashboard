import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["username", "submit", "error"];

  validate() {
    const username = this.usernameTarget.value.trim();

    if (username === "") {
      this.errorTarget.textContent = "Username cannot be blank";
      this.submitTarget.disabled = true;
    } else {
      this.errorTarget.textContent = "";
      this.submitTarget.disabled = false;
    }
  }
}
