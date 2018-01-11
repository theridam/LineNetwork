%% Condition: 0 <= r(t) <= rMax

function [ road ] = cond_r( e,tn,road,eps )

    if (e>1)
        if ( road.r{e}( tn + 1 )  <= -eps )
            road.r{e}(tn+1) = 0.e00;
        end
        if ( road.r{e}( tn + 1 )  >= road.rMax{e} + eps )
            road.r{e}(tn+1) = road.rMax{e};
        end
    end

end