import { Controller } from 'stimulus'

export default class extends Controller {
    initialize() {
        this.id = this.data.get('id')
        console.log(this.id)
    }

    connect() {
        CKEDITOR.replace(this.id)
    }
}