import Game from "./game"
import React from "react"
import ReactDOM from "react-dom"

document.addEventListener("DOMContentLoaded", () => {
    const reactRoot = document.getElementById('react-root');
    ReactDOM.render(<Game />, reactRoot)
})