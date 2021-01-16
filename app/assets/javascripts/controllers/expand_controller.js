import { Controller } from 'stimulus'
import Jodit from '

export default class extends Controller {
    static targets = [ "expandButton", 'expandValue', 'test' ]

    initialize() {
        this.activeText = this.data.get("active-text");
        this.inactiveText = this.data.get("inactive-text");
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
        this.expandValueTarget.style.display = this.active ? 'block' : 'none'
        this.expandButtonTarget.innerHTML = this.active ? this.activeText : this.inactiveText

        // let editor = new EditorJS()
        //
        // console.log(editor)
    }
}