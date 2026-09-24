--
--  Copyright (C) 2026, Vadim Godunko
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--

pragma Ada_2022;

with A0B.Types.Enumerable;

with ESPIDF.C_Strings;

package ESPIDF.Partition is

   type esp_partition_type_t is new A0B.Types.Enumerable.Enumerable_8
     with Convention => C;

   function ESP_PARTITION_TYPE_APP             return esp_partition_type_t is
     (16#00#) with Static;
   function ESP_PARTITION_TYPE_DATA            return esp_partition_type_t is
     (16#01#) with Static;
   function ESP_PARTITION_TYPE_BOOTLOADER      return esp_partition_type_t is
     (16#02#) with Static;
   function ESP_PARTITION_TYPE_PARTITION_TABLE return esp_partition_type_t is
     (16#03#) with Static;
   function ESP_PARTITION_TYPE_ANY             return esp_partition_type_t is
     (16#FF#) with Static;

   type esp_partition_subtype_t is new A0B.Types.Enumerable.Enumerable_8
     with Convention => C;

   function ESP_PARTITION_SUBTYPE_BOOTLOADER_PRIMARY
     return esp_partition_subtype_t is (16#00#) with Static;
   function ESP_PARTITION_SUBTYPE_BOOTLOADER_OTA
     return esp_partition_subtype_t is (16#01#) with Static;
   function ESP_PARTITION_SUBTYPE_BOOTLOADER_RECOVERY
     return esp_partition_subtype_t is (16#02#) with Static;

   function ESP_PARTITION_SUBTYPE_PARTITION_TABLE_PRIMARY
     return esp_partition_subtype_t is (16#00#) with Static;
   function ESP_PARTITION_SUBTYPE_PARTITION_TABLE_OTA
     return esp_partition_subtype_t is (16#01#) with Static;

   function ESP_PARTITION_SUBTYPE_APP_FACTORY
     return esp_partition_subtype_t is (16#00#) with Static;
   function ESP_PARTITION_SUBTYPE_APP_OTA_MIN
     return esp_partition_subtype_t is (16#10#) with Static;
   function ESP_PARTITION_SUBTYPE_APP_OTA_0
     return esp_partition_subtype_t is (16#10#) with Static;
   function ESP_PARTITION_SUBTYPE_APP_OTA_1
     return esp_partition_subtype_t is (16#11#) with Static;
   function ESP_PARTITION_SUBTYPE_APP_OTA_2
     return esp_partition_subtype_t is (16#12#) with Static;
   function ESP_PARTITION_SUBTYPE_APP_OTA_3
     return esp_partition_subtype_t is (16#13#) with Static;
   function ESP_PARTITION_SUBTYPE_APP_OTA_4
     return esp_partition_subtype_t is (16#14#) with Static;
   function ESP_PARTITION_SUBTYPE_APP_OTA_5
     return esp_partition_subtype_t is (16#15#) with Static;
   function ESP_PARTITION_SUBTYPE_APP_OTA_6
     return esp_partition_subtype_t is (16#16#) with Static;
   function ESP_PARTITION_SUBTYPE_APP_OTA_7
     return esp_partition_subtype_t is (16#17#) with Static;
   function ESP_PARTITION_SUBTYPE_APP_OTA_8
     return esp_partition_subtype_t is (16#18#) with Static;
   function ESP_PARTITION_SUBTYPE_APP_OTA_9
     return esp_partition_subtype_t is (16#19#) with Static;
   function ESP_PARTITION_SUBTYPE_APP_OTA_10
     return esp_partition_subtype_t is (16#1A#) with Static;
   function ESP_PARTITION_SUBTYPE_APP_OTA_11
     return esp_partition_subtype_t is (16#1B#) with Static;
   function ESP_PARTITION_SUBTYPE_APP_OTA_12
     return esp_partition_subtype_t is (16#1C#) with Static;
   function ESP_PARTITION_SUBTYPE_APP_OTA_13
     return esp_partition_subtype_t is (16#1D#) with Static;
   function ESP_PARTITION_SUBTYPE_APP_OTA_14
     return esp_partition_subtype_t is (16#1E#) with Static;
   function ESP_PARTITION_SUBTYPE_APP_OTA_15
     return esp_partition_subtype_t is (16#1F#) with Static;
   function ESP_PARTITION_SUBTYPE_APP_OTA_MAX
     return esp_partition_subtype_t is (16#20#) with Static;
   function ESP_PARTITION_SUBTYPE_APP_TEST
     return esp_partition_subtype_t is (16#20#) with Static;

   function ESP_PARTITION_SUBTYPE_APP_TEE_MIN
     return esp_partition_subtype_t is (16#30#) with Static;
   function ESP_PARTITION_SUBTYPE_APP_TEE_0
     return esp_partition_subtype_t is (16#30#) with Static;
   function ESP_PARTITION_SUBTYPE_APP_TEE_1
     return esp_partition_subtype_t is (16#31#) with Static;
   function ESP_PARTITION_SUBTYPE_APP_TEE_MAX
     return esp_partition_subtype_t is (16#31#) with Static;

   function ESP_PARTITION_SUBTYPE_DATA_OTA
     return esp_partition_subtype_t is (16#00#) with Static;
   function ESP_PARTITION_SUBTYPE_DATA_PHY
     return esp_partition_subtype_t is (16#01#) with Static;
   function ESP_PARTITION_SUBTYPE_DATA_NVS
     return esp_partition_subtype_t is (16#02#) with Static;
   function ESP_PARTITION_SUBTYPE_DATA_COREDUMP
     return esp_partition_subtype_t is (16#03#) with Static;
   function ESP_PARTITION_SUBTYPE_DATA_NVS_KEYS
     return esp_partition_subtype_t is (16#04#) with Static;
   function ESP_PARTITION_SUBTYPE_DATA_EFUSE_EM
     return esp_partition_subtype_t is (16#05#) with Static;
   function ESP_PARTITION_SUBTYPE_DATA_UNDEFINED
     return esp_partition_subtype_t is (16#06#) with Static;

   function ESP_PARTITION_SUBTYPE_DATA_ESPHTTPD
     return esp_partition_subtype_t is (16#80#) with Static;
   function ESP_PARTITION_SUBTYPE_DATA_FAT
     return esp_partition_subtype_t is (16#81#) with Static;
   function ESP_PARTITION_SUBTYPE_DATA_SPIFFS
     return esp_partition_subtype_t is (16#82#) with Static;
   function ESP_PARTITION_SUBTYPE_DATA_LITTLEFS
     return esp_partition_subtype_t is (16#83#) with Static;

   function ESP_PARTITION_SUBTYPE_DATA_TEE_OTA
     return esp_partition_subtype_t is (16#90#) with Static;

   function ESP_PARTITION_SUBTYPE_ANY
     return esp_partition_subtype_t is (16#FF#) with Static;

   type esp_partition_t is limited private;

   type const_esp_partition_t_ptr is access constant esp_partition_t
     with Convention => C;

   function esp_partition_find_first
     (partition_type    : esp_partition_type_t;
      partition_subtype : esp_partition_subtype_t;
      Label             : ESPIDF.C_Strings.char_array_string)
      return const_esp_partition_t_ptr;

private

   sizeof_esp_partition_t : constant int
     with Import, Convention => C,
          External_Name => "__ada_SIZEOF_esp_partition_t";

   type esp_partition_t is new C_Object_Storage (1 .. sizeof_esp_partition_t)
     with Convention              => C,
          Default_Component_Value => 0;

end ESPIDF.Partition;
