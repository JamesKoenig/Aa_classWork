
const partyHeader = document.getElementById('party');

export const htmlGenerator = (string, htmlElement) => {
    let children = Array.from(htmlElement.children);
    // debugger
    if (!htmlElement.hasChildNodes()) {
        children.map((child)=> {
            const p = document.createElement("p");
            p.innerText = string;
            htmlElement.append(p);
        })
    }else {
        // debugger
        htmlElement.innerHtml = "";
        const p = document.createElement("p");
        p.innerText = children[children.length - 1].value;
        // p.innerText = string
        htmlElement.append(p);

    }

};

htmlGenerator('Party Time.', partyHeader);