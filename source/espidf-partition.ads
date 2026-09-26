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
   --  Partition type.
   --
   --  Note: Partition types with integer value 16#00#-16#3F# are reserved for
   --  partition types defined by ESP-IDF. Any other integer value
   --  16#40#-16#FE# can be used by individual applications, without
   --  restriction.

   function ESP_PARTITION_TYPE_APP             return esp_partition_type_t is
     (16#00#) with Static;
   --  Application partition type.
   function ESP_PARTITION_TYPE_DATA            return esp_partition_type_t is
     (16#01#) with Static;
   --  Data partition type.
   function ESP_PARTITION_TYPE_BOOTLOADER      return esp_partition_type_t is
     (16#02#) with Static;
   --  Bootloader partition type.
   function ESP_PARTITION_TYPE_PARTITION_TABLE return esp_partition_type_t is
     (16#03#) with Static;
   --  Partition table type.
   function ESP_PARTITION_TYPE_ANY             return esp_partition_type_t is
     (16#FF#) with Static;
   --  Used to search for partitions with any type.

   type esp_partition_subtype_t is new A0B.Types.Enumerable.Enumerable_8
     with Convention => C;
   --  Partition subtype.
   --
   --  Note: These ESP-IDF-defined partition subtypes apply to partitions of
   --  type `ESP_PARTITION_TYPE_APP` and `ESP_PARTITION_TYPE_DATA`.
   --
   --  Application-defined partition types (16#40#-16#FE#) can set any
   --  numeric subtype value.

   function ESP_PARTITION_SUBTYPE_BOOTLOADER_PRIMARY
     return esp_partition_subtype_t is (16#00#) with Static;
   --  Primary Bootloader.
   function ESP_PARTITION_SUBTYPE_BOOTLOADER_OTA
     return esp_partition_subtype_t is (16#01#) with Static;
   --  Temporary OTA storage for Bootloader, where the OTA uploads a new
   --  Bootloader image.
   function ESP_PARTITION_SUBTYPE_BOOTLOADER_RECOVERY
     return esp_partition_subtype_t is (16#02#) with Static;
   --  Recovery Bootloader.

   function ESP_PARTITION_SUBTYPE_PARTITION_TABLE_PRIMARY
     return esp_partition_subtype_t is (16#00#) with Static;
   --  Primary Partition table.
   function ESP_PARTITION_SUBTYPE_PARTITION_TABLE_OTA
     return esp_partition_subtype_t is (16#01#) with Static;
   --  Temporary OTA storage for Partition table, where the OTA uploads a new
   --  Partition table image.

   function ESP_PARTITION_SUBTYPE_APP_FACTORY
     return esp_partition_subtype_t is (16#00#) with Static;
   --  Factory application partition.
   function ESP_PARTITION_SUBTYPE_APP_OTA_MIN
     return esp_partition_subtype_t is (16#10#) with Static;
   --  Base for OTA partition subtypes.
   function ESP_PARTITION_SUBTYPE_APP_OTA_0
     return esp_partition_subtype_t is (16#10#) with Static;
   --  OTA partition 0.
   function ESP_PARTITION_SUBTYPE_APP_OTA_1
     return esp_partition_subtype_t is (16#11#) with Static;
   --  OTA partition 1.
   function ESP_PARTITION_SUBTYPE_APP_OTA_2
     return esp_partition_subtype_t is (16#12#) with Static;
   --  OTA partition 2.
   function ESP_PARTITION_SUBTYPE_APP_OTA_3
     return esp_partition_subtype_t is (16#13#) with Static;
   --  OTA partition 3.
   function ESP_PARTITION_SUBTYPE_APP_OTA_4
     return esp_partition_subtype_t is (16#14#) with Static;
   --  OTA partition 4.
   function ESP_PARTITION_SUBTYPE_APP_OTA_5
     return esp_partition_subtype_t is (16#15#) with Static;
   --  OTA partition 5.
   function ESP_PARTITION_SUBTYPE_APP_OTA_6
     return esp_partition_subtype_t is (16#16#) with Static;
   --  OTA partition 6.
   function ESP_PARTITION_SUBTYPE_APP_OTA_7
     return esp_partition_subtype_t is (16#17#) with Static;
   --  OTA partition 7.
   function ESP_PARTITION_SUBTYPE_APP_OTA_8
     return esp_partition_subtype_t is (16#18#) with Static;
   --  OTA partition 8.
   function ESP_PARTITION_SUBTYPE_APP_OTA_9
     return esp_partition_subtype_t is (16#19#) with Static;
   --  OTA partition 9.
   function ESP_PARTITION_SUBTYPE_APP_OTA_10
     return esp_partition_subtype_t is (16#1A#) with Static;
   --  OTA partition 10.
   function ESP_PARTITION_SUBTYPE_APP_OTA_11
     return esp_partition_subtype_t is (16#1B#) with Static;
   --  OTA partition 11.
   function ESP_PARTITION_SUBTYPE_APP_OTA_12
     return esp_partition_subtype_t is (16#1C#) with Static;
   --  OTA partition 12.
   function ESP_PARTITION_SUBTYPE_APP_OTA_13
     return esp_partition_subtype_t is (16#1D#) with Static;
   --  OTA partition 13.
   function ESP_PARTITION_SUBTYPE_APP_OTA_14
     return esp_partition_subtype_t is (16#1E#) with Static;
   --  OTA partition 14.
   function ESP_PARTITION_SUBTYPE_APP_OTA_15
     return esp_partition_subtype_t is (16#1F#) with Static;
   --  OTA partition 15.
   function ESP_PARTITION_SUBTYPE_APP_OTA_MAX
     return esp_partition_subtype_t is (16#20#) with Static;
   --  Max subtype of OTA partition.
   function ESP_PARTITION_SUBTYPE_APP_TEST
     return esp_partition_subtype_t is (16#20#) with Static;
   --  Test application partition.

   function ESP_PARTITION_SUBTYPE_APP_TEE_MIN
     return esp_partition_subtype_t is (16#30#) with Static;
   --  Base for TEE partition subtypes.
   function ESP_PARTITION_SUBTYPE_APP_TEE_0
     return esp_partition_subtype_t is (16#30#) with Static;
   --  TEE partition 0.
   function ESP_PARTITION_SUBTYPE_APP_TEE_1
     return esp_partition_subtype_t is (16#31#) with Static;
   --  TEE partition 1.
   function ESP_PARTITION_SUBTYPE_APP_TEE_MAX
     return esp_partition_subtype_t is (16#31#) with Static;
   --  Max subtype of TEE partition.

   function ESP_PARTITION_SUBTYPE_DATA_OTA
     return esp_partition_subtype_t is (16#00#) with Static;
   --  OTA selection partition.
   function ESP_PARTITION_SUBTYPE_DATA_PHY
     return esp_partition_subtype_t is (16#01#) with Static;
   --  PHY init data partition.
   function ESP_PARTITION_SUBTYPE_DATA_NVS
     return esp_partition_subtype_t is (16#02#) with Static;
   --  NVS partition.
   function ESP_PARTITION_SUBTYPE_DATA_COREDUMP
     return esp_partition_subtype_t is (16#03#) with Static;
   --  COREDUMP partition.
   function ESP_PARTITION_SUBTYPE_DATA_NVS_KEYS
     return esp_partition_subtype_t is (16#04#) with Static;
   --  Partition for NVS keys.
   function ESP_PARTITION_SUBTYPE_DATA_EFUSE_EM
     return esp_partition_subtype_t is (16#05#) with Static;
   --  Partition for emulate eFuse bits.
   function ESP_PARTITION_SUBTYPE_DATA_UNDEFINED
     return esp_partition_subtype_t is (16#06#) with Static;
   --  Undefined (or unspecified) data partition.

   function ESP_PARTITION_SUBTYPE_DATA_ESPHTTPD
     return esp_partition_subtype_t is (16#80#) with Static;
   --  ESPHTTPD partition.
   function ESP_PARTITION_SUBTYPE_DATA_FAT
     return esp_partition_subtype_t is (16#81#) with Static;
   --  FAT partition.
   function ESP_PARTITION_SUBTYPE_DATA_SPIFFS
     return esp_partition_subtype_t is (16#82#) with Static;
   --  SPIFFS partition.
   function ESP_PARTITION_SUBTYPE_DATA_LITTLEFS
     return esp_partition_subtype_t is (16#83#) with Static;
   --  LITTLEFS partition.

   function ESP_PARTITION_SUBTYPE_DATA_TEE_OTA
     return esp_partition_subtype_t is (16#90#) with Static;
   --  TEE OTA selection partition.

   function ESP_PARTITION_SUBTYPE_ANY
     return esp_partition_subtype_t is (16#FF#) with Static;
   --  Used to search for partitions with any subtype.

   type esp_partition_t is limited private;
   --  Partition information structure.
   --
   --  This is not the format in flash, that format is `esp_partition_info_t`.
   --
   --  However, this is the format used by this API.

   type const_esp_partition_t_ptr is access constant esp_partition_t
     with Convention => C;

   function esp_partition_find_first
     (partition_type    : esp_partition_type_t;
      partition_subtype : esp_partition_subtype_t;
      Label             : ESPIDF.C_Strings.char_array_string)
      return const_esp_partition_t_ptr;
   --  Find first partition based on one or more parameters.
   --  @param partition_type
   --    Partition type, one of `esp_partition_type_t` values or an 8-bit
   --    unsigned integer. To find all partitions, no matter the type, use
   --    `ESP_PARTITION_TYPE_ANY`, and set `partition_subtype` argument to
   --    `ESP_PARTITION_SUBTYPE_ANY`.
   --  @param partition_subtype
   --    Partition subtype, one of `esp_partition_subtype_t` values or an
   --    8-bit unsigned integer. To find all partitions of given type, use
   --    `ESP_PARTITION_SUBTYPE_ANY`.
   --  @param Label
   --    Partition label. Only partition with this specific name is looked
   --    for.
   --  @return
   --    Pointer to `esp_partition_t` structure, or null if no partition is
   --    found. This pointer is valid for the lifetime of the application.

private

   sizeof_esp_partition_t : constant int
     with Import, Convention => C,
          External_Name => "__ada_SIZEOF_esp_partition_t";

   type esp_partition_t is new C_Object_Storage (1 .. sizeof_esp_partition_t)
     with Convention              => C,
          Default_Component_Value => 0;

end ESPIDF.Partition;
