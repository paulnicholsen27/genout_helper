require 'csv'

def create_singers(table, active=true)
    for row in table
        Singer.create(
            first_name: row["First Name"],
            last_name: row["Last Name"],
            phone_number: row["Cell"],
            pronoun: row["Pron."],
            active: active,
            birthday: Date.strptime(row["Birthday"], '%m/%d/%y')

        )
    end
end

Singer.destroy_all

active_singers = CSV.parse(File.read("active.csv"), headers: true)
create_singers(active_singers)

inactive_singers = CSV.parse(File.read("inactive.csv"), headers: true)
create_singers(inactive_singers, false)

alums = CSV.parse(File.read("inactive.csv"), headers: true)
create_singers(alums, false)