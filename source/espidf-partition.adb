--
--  Copyright (C) 2026, Vadim Godunko
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--

package body ESPIDF.Partition is

   ------------------------------
   -- esp_partition_find_first --
   ------------------------------

   function esp_partition_find_first
     (partition_type    : esp_partition_type_t;
      partition_subtype : esp_partition_subtype_t;
      Label             : ESPIDF.C_Strings.char_array_string)
      return const_esp_partition_t_ptr
   is
      function Imported
        (partition_type    : uint8_t;
         partition_subtype : uint8_t;
         Label             : ESPIDF.C_Strings.const_char_ptr)
         return const_esp_partition_t_ptr
       with Import, Convention => C,
            External_Name => "__ada_esp_partition_find_first";

   begin
      return
        Imported
          (uint8_t (partition_type),
           uint8_t (partition_subtype),
           ESPIDF.C_Strings.As_const_char_ptr (Label));
   end esp_partition_find_first;

end ESPIDF.Partition;
