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
			
			# Gets a block by height
			def get_by_height height
				Model::ChainBlock.where(:chain_id => @chain_id, :in_longest => 1, :block_height => height).first
			end
			
			# Gets a block by hash
			def get_by_hash hash
				Model::ChainBlock.where(:chain_id => @chain_id, :in_longest => 1, :block_hash => hash).first
			end
		end
	end
end
