script.on_event(defines.events.on_research_finished,
	function(event)
		local tech = event.research
		local force = tech.force
		if tech.level >= tech.prototype.max_level then -- No more levels to go
			for _, succ in pairs(tech.successors) do -- Check all successive techs...
				if succ.upgrade then -- and queue any that are upgrades
					force.add_research(succ)
				end
			end
		else -- If there are more levels, just queue the same tech again
			force.add_research(tech)
		end
	end
)
