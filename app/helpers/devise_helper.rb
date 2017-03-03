module DeviseHelper
   def devise_error_messages!
     return '' if resource.errors.empty?

     messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
     html = <<-HTML

     <div class="mdl-cell mdl-cell--2-offset-desktop mdl-cell--8-col-desktop
           mdl-cell--1-offset-tablet mdl-cell--6-col-tablet
           mdl-cell--4-col-phone
           mdl-card mdl-shadow--3dp alert alert-danger">
       <div class="mdl-card__title alert-danger-title">
         <h4 class="pull-right">Danger</h4>
       </div>
       <div class="mld-card__supporting-text pull-right">
           #{messages}
       </div>
       <div class="mdl-card__menu">
         <a href="/users/sign_up/"class="close mdl-button mdl-js-button mdl-button--fab mdl-button--colored-danger mdl-js-ripple-effect" data-dismiss="alert">
           <i class="material-icons">clear</i>
         </a>
       </div>
     </div>

     HTML

     html.html_safe
   end
 end
