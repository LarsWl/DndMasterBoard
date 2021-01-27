import { Controller } from 'stimulus'

export default class extends Controller {
    static targets = ['form']
    initialize() {
    }

    connect() {
    }

    reset() {
        this.formTarget.reset()
    }
}