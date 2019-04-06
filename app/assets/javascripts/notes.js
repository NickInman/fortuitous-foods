function Note(attributes){
    this.content = attributes.content
    this.id = attributes.id
    this.user = attributes.user
}

Note.prototype.renderNote = function(){
 return `<div>
          <strong><p>${this.user.first_name} ${this.user.last_name}<p></strong>
          <p>${this.content}</p>
        </div>`
}

$(function(){
  $("form#new_note").on("submit", function(e){
    e.preventDefault()
      let $form = $(this)
      let action = $form.attr("action")
      let params = $form.serialize()

      $.ajax({
        url: action,
        data: params,
        dataType: "json",
        type: "POST",
        success: function(json){
          let note = new Note(json)
          let noteP = note.renderNote()

         $(".notes-content").append(noteP)
          document.getElementById("new_note").reset()
          document.getElementsByTagName("input").disabled = true
        }
     })
  })
})
