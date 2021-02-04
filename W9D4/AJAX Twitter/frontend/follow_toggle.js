class FollowToggle {
    constructor(el) {
        this.$el = $(el)
        this.userId = this.$el.data('user-id');
        this.followState = this.$el.data('initial-follow-state');

        this.render();
    }

    render(){
        //choose what the button html texts will be
        if (this.followState === "unfollowed") {
            this.$el.html("Follow!")
        }
        if (this.followState === "followed") {
            this.$el.html("Unfollow!")
        }
    }

    //AJAX
    handleClick(event){
        
        event.preventDefault();
        if (this.followState === "Unfollowed"){
            $.ajax({
                url: '/users/:id/follow',
                type: 'POST',
                data: formData,
                success() {
                    console.log('Your callback here!');
                }
            });
            this.followState = 'followed'
        }else{
            $.ajax({
                url: '/users/:id/follow',
                type: 'POST/DELETE',
                data: formData,
                success() {
                    console.log('Your callback here!');
                }
            });
            this.followState = 'unfollowed'
        }
        this.render();
        
    }
}

module.exports = FollowToggle;