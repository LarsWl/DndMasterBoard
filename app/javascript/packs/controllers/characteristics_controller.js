import { Controller } from 'stimulus'

export default class extends Controller {
    static targets = [ 'value' ]

    initialize() {
        this.value = this.data.get('value')
        this.id = this.data.get('id')
        this.r_timeout = null
    }

    connect() {
        this.refresh()
    }

    increase() {
        this.value++;
        this.refresh();
        this.sendPatchRequest();
    }

    decrease() {
        this.value--;
        this.refresh();
        this.sendPatchRequest();
    }

    async updateCharacteristic() {
        let url = `/main_characteristics/${this.id}`
        const csrf_token = document.head.querySelector("[name=csrf-token]").content;
        let body = {
            value: this.value
        }

        await fetch(url, {
            method: 'PATCH',
            headers: {
                'Accept': 'text/vnd.turbo-stream.html, text/html, application/xhtml+xml',
                'X-Requested-With': 'XMLHttpRequest',
                'Content-Type': 'application/json',
                'X-CSRF-Token': csrf_token,
            },
            body: JSON.stringify(body)
        })
    }

    sendPatchRequest() {
        if (this.r_timeout) {
            clearTimeout(this.r_timeout)
        }

        this.r_timeout = setTimeout(function (){
            this.updateCharacteristic();
        }.bind(this),500)
    }


    refresh() {
        this.valueTarget.innerText = this.value
    }
}