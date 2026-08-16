<form id="contactForm" method="post" action="submit_contact.php">
        <div class="form-row">
          <div>
            <input type="text" id="ctNom" name="nomExpediteur" placeholder="<?php echo __('contact_label_name'); ?>" autocomplete="name">
            <p class="field-error" id="ctErrNom"><?php echo __('contact_err_name'); ?></p>
          </div>
          <div>
            <input type="email" id="ctEmail" name="emailExpediteur" placeholder="<?php echo __('contact_label_email'); ?>" autocomplete="email">
            <p class="field-error" id="ctErrEmail"><?php echo __('contact_err_email'); ?></p>
          </div>
        </div>
        <div class="form-row">
          <div>
            <input type="tel" id="telephone" name="telephoneExpediteur" placeholder="<?php echo __('contact_placeholder_phone'); ?>" autocomplete="tel">
          </div>
          <div>
            <select id="sujet" aria-label="<?php echo __('contact_heading'); ?>" name="typeMessage">
              <option value="<?php echo __('contact_select_general'); ?>"><?php echo __('contact_select_general'); ?></option>
              <option value="<?php echo __('contact_select_visit'); ?>"><?php echo __('contact_select_visit'); ?></option>
              <option value="<?php echo __('contact_select_enroll'); ?>"><?php echo __('contact_select_enroll'); ?></option>
              <option value="<?php echo __('contact_select_other'); ?>"><?php echo __('contact_select_other'); ?></option>
            </select>
          </div>
        </div>
        <div class="form-row full">
          <div>
            <textarea id="ctMessage" placeholder="<?php echo __('contact_placeholder_message'); ?>" name="contenuMessage"></textarea>
            <p class="field-error" id="ctErrMessage"><?php echo __('contact_err_message'); ?></p>
          </div>
        </div>
        <button type="submit" class="btn btn-crayon"><?php echo __('contact_button_send'); ?></button>
        <p class="form-msg" id="ctMsg"></p>
      </form>