# module TencentTrustsql
#   module Tools
#     module KeyTransformer

#       include IOFormatter

#       def private_out_to_public_out private_out
#         private_key = input_formatter.localize private_out
#         public_key = TencentTrustsql::CURVE.generator.multiply_by_scalar(p_key)
#       end



#       end

#     end
#   end
# end