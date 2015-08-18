namespace :seed do
  desc "Seeds data"
  task rosters: :environment do
    rosters = [
      {
        name: "Real Madrid",
        player_names: [
          "Cristiano Ronaldo",
          "Gareth Bale",
          "Marcelo", 
          "James Rodriguez",
          "Sergio Ramos",
          "Toni Kroos",
          "Isco",
          "Karim Benzema", 
          "Pepe",
          "Alvaro Arbeloa",
          "Jese",
        ]
      }, {
        name: "FC Barcelona",
        player_names: [
          "Leonel Messi",
          "Andres Iniesta",
          "Neymar",
          "Gerard Pique",
          "Dani Alves",
          "Javier Mascherano",
          "Luis Suarez",
          "Pedro",
          "Marc Bartra",
          "Jordi Alba",
          "Sergi Roberto",
        ]
      }, {
        name: "Bayern Munich",
        player_names: [
          "Arjen Robben",
          "Robert Lewandowski",
          "Manuel Neuer",
          "Franck Ribery",
          "Mario Gotze",
          "Thomas Muller",
          "Thiago Alcantara",
          "Xabi Alonso",
          "Rafina",
          "David Alba",
          "Jerome Boateng"
        ]
      }, {
        name: "Paris Saint-Germain F.C.",
        player_names: [
          "Zlatan Ibrahimovic",
          "Edinson Cavani",
          "David Luiz",
          "Marco Verratti",
          "Angel Di Maria",
          "Thiago Silva",
          "Javier Pastore",
          "Lucas Moura",
          "Ezequiel Lavezzi",
          "Maxwell",
          "Thiago Motta"
        ]
      }
    ]

    # Create teams and rosters
    rosters.each do |roster|
      team = Team.create!(name: roster[:name])

      roster[:player_names].each do |player_name|
        Player.create!(name: player_name, team: team)
      end
    end

  end

end
