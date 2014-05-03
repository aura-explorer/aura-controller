module Aura
	module Controller
		# In charge of getting block summaries from chains
		class ChainBlockController
			# Creates a new controller that uses chain `chain_id`
			def initialize chain_id
				@chain_id = chain_id
			end
			
			# Gets the last `count` blocks on the chain
			def get_last count = 20
				Model::ChainBlock.where(:chain_id => @chain_id, :in_longest => 1).order(block_height: :desc).limit(count)
			end
		end
	end
end
