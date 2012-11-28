jQuery ->
  $('#practitioner_modality_ids').chosen({
    create_option: true,
    persistent_create_option: true
    no_results_text: "No modalities matched"
    create_option_text: 'Create modality'
    })
