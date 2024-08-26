import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["togglableDetail", "togglableForm"]

  show_detail(event) {
    // get a target according to the clicked object's id
    const taskId = event.currentTarget.dataset.taskId;
    const detailTarget = this.togglableDetailTargets.find(target => target.dataset.taskId === taskId);
    if (detailTarget) {
      detailTarget.classList.toggle("d-none");
    }
  }

  show_form() {
    this.togglableFormTarget.classList.toggle("d-none");
  }
}
