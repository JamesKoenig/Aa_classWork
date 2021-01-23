
const partyHeader = document.getElementById('party');

export const htmlGenerator = (string, htmlElement) => {
     let ele = document.createElement('p');
     ele.innerText = string;
     htmlElement.append(ele);
};

htmlGenerator('Party Time.', partyHeader);

htmlGenerator('I <3 vanilla DOM manipulation.', partyHeader);