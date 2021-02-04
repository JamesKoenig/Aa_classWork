import React from 'react'

class Clock extends React.Component {
    constructor(props) {
        super(props);
        this.state = {time: new Date()}
        this.tick = this.tick.bind(this)
    }

    componentDidMount() {
        this.intervalId = setInterval(this.tick, 1000)
    }

    componentWillUnmount() {
       // this.intervalId = setInterval(this.tick, 1000)
        clearInterval(this.intervalId)
    }

    tick() {
        this.setState({time: new Date()})
    }

    render() {
        let hours = this.state.time.getHours();
        let minutes = this.state.time.getMinutes();
        let seconds= this.state.time.getSeconds();

        return(
            <>
                <h1>Clock</h1>
                <br/>
                <div class="clock_stuff">
                    <p>
                        <span>Time:</span>
                        <span>{hours}:{minutes}:{seconds} PDT </span>
                    </p>
                    <p>
                       <span>Date:</span>
                       <span>{this.state.time.toDateString()}</span> 
                    </p>
                    <br/>
                </div>
            </>
        )
    }
}


export default Clock;