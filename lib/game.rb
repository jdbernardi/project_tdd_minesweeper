	# MINESWEEPER GAME
		# VICTORY?
			# ALL MINES MARKED
			# ALL SQUARES REVEALED/CLEARED
		# LOSS
			# MINE REVEALED
require_relative 'board'
require_relative 'player'
require_relative 'render'

class Game



	def initialize( difficulty = nil )

		@board = Board.new
		@player = Player.new
		@render = Render.new

	end


	def play

		@board.place_mines
		@board.populate_hints

		loop do

			@render.render_flags( @board.flags )
			@render.render_board( @board.display_board )

			until @board.valid_coordinates?( @player.get_coordinates )

				@player.get_coordinates

			end

			player_choice( @player.get_move )

		end


	end



	def player_choice( menu_selection )

		case menu_selection

		when 1

			@board.reveal_square
			@board.check_for_mine

		when 2

			@board.place_flag

		when 3

			@board.remove_flag

		when 4

			exit

		end


	end



	def check_victory



	end


end

game = Game.new
game.play
