<?php
namespace MailPoetVendor\Egulias\EmailValidator\Warning;
if (!defined('ABSPATH')) exit;
use MailPoetVendor\Egulias\EmailValidator\EmailParser;
class EmailTooLong extends Warning
{
 const CODE = 66;
 public function __construct()
 {
 $this->message = 'Email is too long, exceeds ' . EmailParser::EMAIL_MAX_LENGTH;
 }
}
