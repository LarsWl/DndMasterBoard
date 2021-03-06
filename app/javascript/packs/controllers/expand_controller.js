import { Controller } from 'stimulus'

export default class extends Controller {
    static targets = [ "expandButton", 'expandValue', 'test' ]

    initialize() {
        this.activeText = this.data.get("active-text");
        this.inactiveText = this.data.get("inactive-text");
        this.id = this.data.get('id')
    }

    connect() {
        this.active = false;
        this.refresh();
    }

    disconnect() {
        this.element.setAttribute("data-campaigns-active", !!this.active);
    }

    expand() {
        this.active = !this.active;
        this.refresh();
    }


    refresh() {
        console.log('here')
        this.expandValueTarget.style.display = this.active ? 'block' : 'none'
        this.expandButtonTarget.innerHTML = this.active ? this.activeText : this.inactiveText
    }
}