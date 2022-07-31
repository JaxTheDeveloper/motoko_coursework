import { coursework_semifinal_backend } from "../../declarations/coursework_semifinal_backend";

window.addEventListener("load", async function() {
  console.log("Finished loading");
});

document.querySelector("form").addEventListener("submit", async (e) => {
  e.preventDefault();
  const button = e.target.querySelector("button");

  const name = document.getElementById("name").value.toString();

  button.setAttribute("disabled", true);

  // Interact with foo actor, calling the greet method
  const greeting = await coursework_semifinal_backend.greet(name) 

  button.removeAttribute("disabled");

  document.getElementById("greeting").innerText = greeting;

  return false;
});
