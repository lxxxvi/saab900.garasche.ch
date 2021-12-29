import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ['confirmableButton', 'cancelButton', 'ultimateButton'];
  static values = {
    confirmableButtonText: String,
    ultimateButtonText: String,
    showUltimateButton: Boolean
  }

  connect() {
    this.confirmableButtonTarget.innerHTML = this.confirmableButtonTextValue;
    this.ultimateButtonTarget.innerHTML = this.ultimateButtonTextValue;
    this.render();
  }

  render() {
    if (this.showUltimateButtonValue) {
      this.confirmableButtonTarget.classList.add('hidden');
      this.cancelButtonTarget.classList.remove('hidden');
      this.ultimateButtonTarget.classList.remove('hidden');
    } else {
      this.confirmableButtonTarget.classList.remove('hidden');
      this.cancelButtonTarget.classList.add('hidden');
      this.ultimateButtonTarget.classList.add('hidden');
    }
  }

  showUltimateButton() {
    this.showUltimateButtonValue = true;
    this.render();
  }

  hideUltimateButton() {
    this.showUltimateButtonValue = false;
    this.render();
  }
}
