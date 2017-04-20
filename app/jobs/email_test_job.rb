class EmailTestJob < ActiveJob::Base
	queue_as :default

	def perform(user, atualizacao)
		CasoMailer.feed_de_casos(user, atualizacao)
	end
end
