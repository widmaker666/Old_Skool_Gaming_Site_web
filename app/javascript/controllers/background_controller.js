import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() { 
        fetch('https://picsum.photos/200/300')
            .then(res => console.log(res)) 
    }

}
