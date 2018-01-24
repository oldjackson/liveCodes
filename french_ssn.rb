# Write a #french_ssn_info method extracting infos from French SSN (Social Security Number) using regexp.

# Valid French SSN numbers have the following pattern:

# "1 84 12 76 451 089 46"

# Gender (1 == man, 2 == woman)
# Year of birth (84)
# Month of birth (12)
# Department of birth (76, basically included between 01 and 99)
# 6 random digits (451 089)
# A 2 digits key (46, we'll see later how it can be deduced from the rest of the digits)

# 76 - Seine-Maritime
# 37 - Idre-et-Loire
# 75 - Paris
# 06 - Alpes-Maritime
# 2B - North Corsica
# 2A - South Corsica
# 92 - Neuilly-sur-Seine

DEPARTMENTS = {
  "76" => "Seine-Maritime",
  "37" => "Idre-et-Loire",
  "75" => "Paris",
  "06" => "Alpes-Maritime"
}

require 'date'


# regex pattern
PATTERN = /(?<gender>1|2)\s?(?<yob>\d{2})\s?(?<mob>[01]\d)\s?(?<department>\d{2})\s?(\d{3}\s?){2}(?<key>\d{2})/

def french_ssn_info(ssn)

  # order is not important when matching regexp with strings
  match_data = PATTERN.match(ssn)
  # ssn.match(PATTERN)

  # extract matched capture groups into local variables
  gender = match_data[:gender] == "1" ? "a man" : "a woman"
  yob = match_data[:yob].to_i
  mob = match_data[:mob].to_i

  # create a new Date object
  dob = Date.new(1900 + yob, mob, 1)

  # fetch department
  department = DEPARTMENTS[match_data[:department]]

  # Validate number
  bignumber = ssn.gsub(" ", "")[0...-2].to_i
  theoritical_key = (97 - bignumber) % 97

  if theoritical_key == match_data[:key].to_i
    # number is valid, create output
    output = ""
    output << gender
    output << ", born in #{dob.strftime("%B, %Y")}"
    output << " in #{department}."
    output
  else
    "The number is invalid"
  end
end


ssns = ["1 84 12 76 451 089 46", "194073765893575", "2 86 10 75 114 511 75"]

ssns.each { |ssn| puts french_ssn_info(ssn) }
