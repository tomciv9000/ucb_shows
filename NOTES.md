How to Build a CLI Gem

1. Plan your gem, imagine your interface
2. Start with the project structrue - google
3. Start with the entry point - the file run
4. force that to build the CLI interface
5. stub out the interface
6. start making things real
7. discover objects
8. program
9. 


- A command line interface for shows at the UCB Theaters in NYC and LA

-user types ucb-shows
  -user selects theater (1-4) or 'exit'
   -a list of that evening's shows are displayed
   -user selects a show (numbered) for more information or can type 'theaters' or 'exit'
      - show information is displayed, user is able to select another show at that theater
      
What is a show?

- a show has a name
- a show has a time
- a show has a ticket URL
- a show has a description
- a show has a price

What is a theater?

- a theater has a name
- a theater has many shows
