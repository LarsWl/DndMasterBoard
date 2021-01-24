import { Controller } from 'stimulus'

export default class extends Controller {
    initialize() {
        this.id = this.data.get('id')
    }

    connect() {
        CKEDITOR.replace(this.id)
    }
}