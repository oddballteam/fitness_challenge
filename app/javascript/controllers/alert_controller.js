import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["container"];

  close() {
    this.containerTarget.remove();
  }
}
