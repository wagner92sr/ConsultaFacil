class Backoffice::CidsController::CidService #POROS - Classes para tirar a responsabilidade dos controllers
	attr_accessor :cid

	def self.create(params_cid)
		@cid = Hospital.new(params_cid)

		if @cid.valid?
			@cid.save!
		end

		@cid
	end
end