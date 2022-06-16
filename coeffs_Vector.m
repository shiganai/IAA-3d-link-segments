function [Coeffs, Terms] = coeffs_Vector(sym_Vector,target_Variables)

target_Variables = [target_Variables, 1];

Coeffs = sym(zeros(size(sym_Vector, 1), size(target_Variables, 2)));
Terms = target_Variables;

for jj = 1:size(sym_Vector, 1)
    [coeffs_Tmp, terms_Tmp] = coeffs(sym_Vector(jj), target_Variables(1:end-1));
    if ~isequal(size(terms_Tmp), size(target_Variables))
        for ii = 1:size(target_Variables, 2)
            if any(terms_Tmp == target_Variables(ii))
                Coeffs(jj, ii) = coeffs_Tmp(terms_Tmp == target_Variables(ii));
            end
        end
    else
        Coeffs(jj, :) = coeffs_Tmp;
    end
end

end