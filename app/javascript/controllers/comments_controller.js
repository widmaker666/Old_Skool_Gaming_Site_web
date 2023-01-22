import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        console.log("Salut bg");
     }
    toggleForm(event) {
        const div = document.getElementsByClassName("commentaire")[0]
        div.classList.toggle("d-none")
        event.preventDefault()
        event.stopPropagation()
    }
}
