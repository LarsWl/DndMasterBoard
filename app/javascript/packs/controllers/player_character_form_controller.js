import { Controller } from 'stimulus'

export default class extends Controller {
    static targets = ['raceDescription', 'characterClassDescription']


    initialize() {
    }

    connect() {
        let race_select = document.getElementById('race_select')
        let class_character_select = document.getElementById('character_class_select')
        this.selected_race_option = document.getElementById(`race_${race_select.value}`)
        this.selected_character_class_option = document.getElementById(`character_class_${class_character_select.value}`)

        this.refresh()
    }

    change_race_description(event) {
        this.selected_race_option = document.getElementById(`race_${event.target.value}`)
        this.refresh();
    }

    change_character_class_description(event) {
        this.selected_character_class_option = document.getElementById(`character_class_${event.target.value}`)
        this.refresh();
    }

    refresh() {
        this.raceDescriptionTarget.innerHTML = this.selected_race_option.getAttribute('description');
        this.characterClassDescriptionTarget.innerHTML = this.selected_character_class_option.getAttribute('description');
    }
}