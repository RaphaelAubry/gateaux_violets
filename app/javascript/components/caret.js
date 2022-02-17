const rotate = (sourceID, targetCaret, targetClass) => {

  const source = document.getElementById(sourceID)
  const targetDivCaret = document.querySelector(targetCaret)
  const targetDiv = document.querySelector(targetClass)

  if (source != null) {


    targetDiv.style.display = "none"
    targetDiv.style.opacity = "0"
    targetDivCaret.style.transition = "all 0.3s ease"
    targetDiv.style.transition = "all 4s ease"

    source.addEventListener('click', (event) => {

      if (targetDiv.style.display == "none"){
        targetDivCaret.style.transform = "rotate(90deg)"

        targetDiv.style.display = ""
        targetDiv.style.opacity = "1"
      }else{
        targetDivCaret.style.transform = "rotate(0deg)"
        targetDiv.style.opacity = "0"
        targetDiv.style.display = "none"
      }
    });
  }
}

export { rotate }