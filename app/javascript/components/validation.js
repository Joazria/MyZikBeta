
// const inputsValues =

const formValidation = {
  // user_gender : /^\w+/,
  // user_first_name : /^\w+/,
  // user_last_name : /^\w+/,
  user_email : /(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])/,
  // user_member : /^\w+/,
  // user_company : /^\w+/,
  // user_activity : /^\w+/,
  // user_activity : /^\w+/,
  // user_country : /^\w+/,
  // user_job : /^\w+/,
  // user_phone : /^\w+/,
  // user_whatsapp : /^\w+/,  
  // user_website : /^\w+/,
  band_email :  /(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])/,
  band_name: /^\w+/,
  band_headline: /^\w+/,
  band_country: /^\w+/,
  band_state: /^\w+/,
  band_city: /^\w+/,
  band_genero1: /^\w+/,
  band_genero2: /^\w+/,
  band_genero3: /^\w+/,
  band_genero4: /^\w+/,
  band_release: /^\w+/,
  band_website: /^\w+/,
  band_instagram: /^\w+/,
  band_spotify: /^\w+/,
  band_youtube: /^\w+/,
  band_yt_video_destak: /^\w+/,
  band_yt_video_one: /^\w+/,

  venue_venue_name: /^\w+/,
  venue_confirmation: /^\w+/,
  venue_name: /^\w+/,
  venue_email: /^\w+/,
  venue_venue_name: /^\w+/,
  venue_tel: /^\w+/,
  venue_venue_name2: /^\w+/,
  venue_email2: /^\w+/,
  venue_tel2: /^\w+/,
  venue_instagram: /^\w+/,  
  venue_website: /^\w+/,

  user_password : /^\w+/,

  user_password_confirmation : /^\w+/

}


const checkfields = (input) => {

 const validate = Object.values(input).every( input => {
 return Boolean(input) === true

 })
 return validate
}

export const validateForm = () => {

  const btn_submit = document.querySelector('.btn.btn-flat')
  const forms = [...document.forms[0].elements]
  let inputsObjects = {}
  forms.map( input =>
   inputsObjects[input.id] = input.value )

  Object.entries(inputsObjects).forEach( element => {
    const [id, value] = element
    if (value ==='') {
      document.getElementById(id)?.classList.remove('is-invalid')
      document.getElementById(id)?.classList.remove('is-valid')
    }

    else if (formValidation[id]?.test(value)) {
      document.getElementById(id).classList.remove('is-invalid')
      document.getElementById(id).classList.add('is-valid')
    }

    else {
      document.getElementById(id)?.classList.remove('is-valid')
      document.getElementById(id)?.classList.add('is-invalid')
    }

  })

  return checkfields(inputsObjects)? btn_submit.disabled = false : btn_submit.disabled = true
}


