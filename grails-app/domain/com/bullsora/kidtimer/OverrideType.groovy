package com.bullsora.kidtimer

public enum OverrideType {
  ALLOW('Allow'), DENY('Deny')

  private final String value

  OverrideType(String value){
    this.value = value;
  }

  String toString() {
    value
  }

  String getKey() {
    name()
  }
}