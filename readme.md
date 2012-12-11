## Chosen-Modality demonstration application

This application demonstrates one implementation of the gem <tt>Chosen</tt>. The Chosen gem makes <tt>select</tt> boxes more user friendly.

This application is also a demonstration of koenpunt's fork of Chosen, which allows users to add options just by typing into the field.

Upon creating a New Practitioner, you'll see two different methods for assigning the practitioner's <tt>modality</tt>.

1. The Old Manual Method on the left allows selection without Chosen.
2. The New Chosen Method on the right uses Chosen, including koenpunt's feature for enabling option adding.

* live demo application: http://chosen-modality.herokuapp.com
* the Chosen gem: http://harvesthq.github.com/chosen
* koenpunt's fork to enable option adding: https://github.com/harvesthq/chosen/pull/166

## Old Manual Method

This method uses the technique from <a href="http://railscasts.com/episodes/57-create-model-through-text-field">Railscast #57</a> Create Model Through Text Field. The select field contains known choices. A separate text field allows entry of a single new value.

When submitted, a before\_save filter creates a new choice in the database if the text field is not blank.

## New Chosen Method

<b>Chosen</b> provides a drop-in replacement for the <tt>select</tt> field. A list of IDs selected is passed back to the controller.

With koenpunt/chosen, the user may also type any number of new values into the field. The list passed to the controller contains IDs for existing values, and strings for newly-entered options:
  ["47", "Sleep Therapy", "22", "Hot Yoga"]

The demonstration application handles this mixed list by preprocessing the list at the start of the <tt>create</tt> and <tt>update</tt> controller actions.

Strings are moved to a separate field (new\_modalities), IDs are left in the list. After ApplicationController#isolate\_new\_modalities:

practitioner\_modality\_ids:
  ["47", "22"]
  
new\_modalities:
  ["Sleep Therapy", "Hot Yoga"]


When submitted, a before\_save filter creates new choices for any items listed in the new_modalities text field.

## CodeMap of the pieces that make up the <b>New Chosen Method</b>:

* 
<a href="chosen-modality/blob/master/app/models/practitioner.rb">model</a>
with before_save

<a href="https://github.com/slothbear/chosen-modality/blob/master/app/controllers/practitioners_controller.rb#L42">controller</a> create and update actions

<a href="https://github.com/slothbear/chosen-modality/blob/master/app/controllers/application_controller.rb">isolate\_new\_modalities</a> and other helper methods.

<a href="https://github.com/slothbear/chosen-modality/blob/master/app/assets/javascripts/practitioners.js.coffee">add Chosen to the select field</a>
