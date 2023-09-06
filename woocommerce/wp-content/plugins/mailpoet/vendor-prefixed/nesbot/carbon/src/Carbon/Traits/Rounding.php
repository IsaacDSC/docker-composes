<?php
namespace MailPoetVendor\Carbon\Traits;
if (!defined('ABSPATH')) exit;
use MailPoetVendor\Carbon\CarbonInterface;
use MailPoetVendor\Carbon\Exceptions\UnknownUnitException;
trait Rounding
{
 use IntervalRounding;
 public function roundUnit($unit, $precision = 1, $function = 'round')
 {
 $metaUnits = [
 // @call roundUnit
 'millennium' => [static::YEARS_PER_MILLENNIUM, 'year'],
 // @call roundUnit
 'century' => [static::YEARS_PER_CENTURY, 'year'],
 // @call roundUnit
 'decade' => [static::YEARS_PER_DECADE, 'year'],
 // @call roundUnit
 'quarter' => [static::MONTHS_PER_QUARTER, 'month'],
 // @call roundUnit
 'millisecond' => [1000, 'microsecond'],
 ];
 $normalizedUnit = static::singularUnit($unit);
 $ranges = \array_merge(static::getRangesByUnit(), [
 // @call roundUnit
 'microsecond' => [0, 999999],
 ]);
 $factor = 1;
 $initialMonth = $this->month;
 if ($normalizedUnit === 'week') {
 $normalizedUnit = 'day';
 $precision *= static::DAYS_PER_WEEK;
 }
 if (isset($metaUnits[$normalizedUnit])) {
 [$factor, $normalizedUnit] = $metaUnits[$normalizedUnit];
 }
 $precision *= $factor;
 if (!isset($ranges[$normalizedUnit])) {
 throw new UnknownUnitException($unit);
 }
 $found = \false;
 $fraction = 0;
 $arguments = null;
 $factor = $this->year < 0 ? -1 : 1;
 $changes = [];
 foreach ($ranges as $unit => [$minimum, $maximum]) {
 if ($normalizedUnit === $unit) {
 $arguments = [$this->{$unit}, $minimum];
 $fraction = $precision - \floor($precision);
 $found = \true;
 continue;
 }
 if ($found) {
 $delta = $maximum + 1 - $minimum;
 $factor /= $delta;
 $fraction *= $delta;
 $arguments[0] += $this->{$unit} * $factor;
 $changes[$unit] = \round($minimum + ($fraction ? $fraction * $function(($this->{$unit} - $minimum) / $fraction) : 0));
 // Cannot use modulo as it lose double precision
 while ($changes[$unit] >= $delta) {
 $changes[$unit] -= $delta;
 }
 $fraction -= \floor($fraction);
 }
 }
 [$value, $minimum] = $arguments;
 $normalizedValue = \floor($function(($value - $minimum) / $precision) * $precision + $minimum);
 $result = $this->{$normalizedUnit}($normalizedValue);
 foreach ($changes as $unit => $value) {
 $result = $result->{$unit}($value);
 }
 return $normalizedUnit === 'month' && $precision <= 1 && \abs($result->month - $initialMonth) === 2 ? $result->{$normalizedUnit}($normalizedValue) : $result;
 }
 public function floorUnit($unit, $precision = 1)
 {
 return $this->roundUnit($unit, $precision, 'floor');
 }
 public function ceilUnit($unit, $precision = 1)
 {
 return $this->roundUnit($unit, $precision, 'ceil');
 }
 public function round($precision = 1, $function = 'round')
 {
 return $this->roundWith($precision, $function);
 }
 public function floor($precision = 1)
 {
 return $this->round($precision, 'floor');
 }
 public function ceil($precision = 1)
 {
 return $this->round($precision, 'ceil');
 }
 public function roundWeek($weekStartsAt = null)
 {
 return $this->closest($this->avoidMutation()->floorWeek($weekStartsAt), $this->avoidMutation()->ceilWeek($weekStartsAt));
 }
 public function floorWeek($weekStartsAt = null)
 {
 return $this->startOfWeek($weekStartsAt);
 }
 public function ceilWeek($weekStartsAt = null)
 {
 if ($this->isMutable()) {
 $startOfWeek = $this->avoidMutation()->startOfWeek($weekStartsAt);
 return $startOfWeek != $this ? $this->startOfWeek($weekStartsAt)->addWeek() : $this;
 }
 $startOfWeek = $this->startOfWeek($weekStartsAt);
 return $startOfWeek != $this ? $startOfWeek->addWeek() : $this->avoidMutation();
 }
}
