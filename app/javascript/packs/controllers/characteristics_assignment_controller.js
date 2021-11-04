import { Controller } from 'stimulus'

export default class extends Controller {
    static targets = ['scoreCount']

    initialize() {
        this.score_sum = 27

        this.prices = {
            default: 1,
            14: 2,
            15: 2
        }

        this.max_value = 15
        this.min_value = 8

        this.refresh()
    }



    update_characteristic(event) {
        const input_id = event.target.getAttribute('for')
        const input = document.getElementById(input_id)
        let value = parseInt(input.value)
        const action = event.target.getAttribute('action')

        value = action === 'increase' ? this.increase(value) : this.decrease(value)

        input.value = value

        this.refresh()
    }

    increase(value) {
        if (value === this.max_value)
            return value

        value = value + 1
        const cost = this.prices[value] || this.prices['default']

        if (cost > this.score_sum)
            return value - 1

        this.score_sum -= cost

        return value
    }

    decrease(value) {
        if (value === this.min_value)
            return value

        const cost = this.prices[value] || this.prices['default']
        value = value - 1

        this.score_sum += cost

        return value
    }

    refresh() {
        this.scoreCountTarget.innerText = this.score_sum
    }
}