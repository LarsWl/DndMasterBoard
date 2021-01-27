import { Controller } from 'stimulus'

export default class extends Controller {
    static targets = [ 'masterCharactersBlock', 'enemyCharactersBlock']

    initialize() {
    }

    connect() {
        this.characters_block = 'masters'
        this.refresh();
    }

    disconnect() {
    }

    choose_masters() {
        this.characters_block = 'masters'
        this.refresh()
    }

    choose_enemies() {
        this.characters_block = 'enemies'
        this.refresh()
    }


    refresh() {
        if(this.characters_block == 'masters') {
            this.masterCharactersBlockTarget.style.display = 'block'
            this.enemyCharactersBlockTarget.style.display = 'none'
        }
        if(this.characters_block == 'enemies') {
            this.masterCharactersBlockTarget.style.display = 'none'
            this.enemyCharactersBlockTarget.style.display = 'block'
        }
    }
}