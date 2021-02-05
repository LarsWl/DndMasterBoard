import { Controller } from 'stimulus'

export default class extends Controller {
    static targets = ['searchInput', 'searchResults']

    initialize() {
    }

    connect() {
    }
    search(event) {
        if (this.r_timeout) {
            clearTimeout(this.r_timeout)
        }

        this.r_timeout = setTimeout(function (){
            this.fetchFriends(this.searchInputTarget.value);
        }.bind(this),500)
    }

    async fetchFriends(nickname) {
        let url = `/friends/suggestions?search_nick=${nickname}`

        fetch(url).then(response => {
            return response.text()
        }).then(html => {
            this.searchResultsTarget.innerHTML = html
        })
    }
}