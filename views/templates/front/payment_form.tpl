{*
* 2007-2016 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author Paggi <contact@paggi.com>
*  @copyright  2003-2017 Paggi
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}




<p class="alert alert-warning validation_msg" style="display: none"></p>

<div class="box">

    <form class="paggi" action="{$link->getModuleLink('paggi', 'validation', [], true)|escape:'html'}" method="post"  >
        <div class="row">

            <div class="col-xs-12 col-sm-12">
                <h3 class="page-subheading">{l s='Payment by credit card' mod='paggi'} - {l s='Choose the card to use' mod='paggi'}</h3>

                <div class="form_content clearfix">	
                    <div class="row">
                        <div class="col-xs-12 col-sm-12">
                            <a  href="{$link->getModuleLink('paggi', 'card')|escape:'html'}"
                                class="btn btn-primary button button-small" >
                                <span>
                                    {l s='Add Card' mod='paggi'}
                                </span>
                            </a>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-xs-12 col-sm-12">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr >								  	
                                            <th style="width: 25%; text-align: center;vertical-align: middle;"> 
                                                {l s='Card type' mod='paggi'}
                                            </th>
                                            <th style="width: 25%; text-align: center;vertical-align: middle;"> {l s='4 latest issues' mod='paggi'}</th>
                                            <th style="width: 30%; text-align: center;vertical-align: middle;"> {l s='Expiration' mod='paggi'}</th>						  	

                                        </tr>
                                    </thead>

                                    <tbody>
                                        {if count($paggiCustomer->cards) > 0}

                                            {foreach from=$paggiCustomer->cards item=card}

                                                <tr style="cursor: pointer;" class="card17">

                                                    <td style="font-size: 18px; text-align: center">
                                                        <label for="{$card['id']}">


                                                            <input type="radio" id="{$card['id']}"  name="PAGGI_CHOOSE_CARD_ID" value="{$card['id']}">
                                                            <img  width="50" src="https://online.paggi.com/images/{$card['brand']|lower}.png" />
                                                        </label>
                                                    </td>
                                                    <td style="font-size: 14px; text-align: center">•••• •••• •••• {$card['last4']}</td>
                                                    <td style="font-size: 14px; text-align: center">{$card['month']|str_pad:2:'0':$smarty.const.STR_PAD_LEFT} / {$card['year']}</td>

                                                    <td>
                                                        <a  href="#"
                                                            data-id="{$card['id']}"
                                                            class="btn btn-primary button button-small delete" >
                                                            <i class="fa fa-trash-o" aria-hidden="true"></i>
                                                        </a>
                                                    </td>


                                                </tr>
                                            {/foreach}

                                        {/if}
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="col-xs-8 col-sm-4">
                            <div class="row">

                                {assign var='sale_message' value={l s='%sx de %s - Total: %s' mod='paggi'}}
                                {assign var='sale_message_in_cast' value={l s='In cast - Total: %s' mod='paggi'}}
                                <div class="col-xs-12 col-sm-12">
                                    <div class="form-group">
                                        <label for="installments">{l s='Number of installments' mod='paggi'}</label>
                                        <select 
                                            id="installments" 
                                            class="form-control" 
                                            name="PAGGI_NUMBER_INSTALLMENT" >

                                            {foreach from=$select_sales item=sale}

                                                {if $sale.installment == 1}

                                                    <option value="{$sale.installment}">
                                                        {$sale_message_in_cast|sprintf : {Tools::displayPrice($sale.total)} }

                                                    </option>

                                                {else}

                                                    <option value="{$sale.installment}">
                                                        {$sale_message|sprintf : $sale.installment : {Tools::displayPrice($sale.installment_amount)} : {Tools::displayPrice($sale.total)} }
                                                    </option>

                                                {/if}


                                            {/foreach}

                                        </select>

                                    </div>
                                </div>


                            </div>

                        </div>
                    </div>




                </div>
            </div>


        </div>




    </form>

</div>

<script type="text/javascript">

    window.endpointDeleteCard = "{$link->getModuleLink('paggi', 'card')}";

    window.methodPaymentMessage = "{l s='Select the card for payment!' mod='paggi'}"


</script>




