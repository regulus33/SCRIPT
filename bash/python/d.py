# Python script to iterate through an array of country codes and interpolate them into the JavaScript snippet
#

c = "GB GH KE LS NG RE TZ US ZM ZW ZA BW"

country_codes = c.split() #Example country codes

js_template = """
    document.getElementById('code').value = 'new_showmax_ge_{}';
    document.getElementById('description').value = 'Showmax General Entertainment';
    document.getElementById('ticket').value = '1331';
    document.getElementById('extends_days').value = '185';
    document.getElementById('valid_from').value = '2024-01-16 08:00:00 UTC';
    document.getElementById('expires_at').value = '2025-01-16 08:00:00 UTC';

    // Set values for select inputs
    // document.getElementById('paid_by').value = 'partner'; // or 'partner'
    // document.getElementById('conditional_access').value = 'trial'; // or 'promotion', 'testing'
    // document.getElementById('conditional_condition').value = 'recurring_method'; // or 'cellphone'
    document.getElementById('country').value = '{}'; // Set this to the correct country value
    document.getElementById('for_client').value = 'showmax'
    // Check checkboxes and radio buttons as needed
    document.getElementById('active').checked = true;
    document.querySelector('input[name="subscription_type"][value="full"]').checked = true;

    =================================================================================================
"""

# Create a list of JS scripts with interpolated country codes
js_scripts = [js_template.format(country.lower(), country.upper()) for country in country_codes]

for js in js_scripts:
    print(js)
