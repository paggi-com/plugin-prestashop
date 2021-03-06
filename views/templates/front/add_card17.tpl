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

{extends file=$layout}

{block name='content'}


    {if $nbProducts <= 0}
        <p class="warning">{l s='Your shopping cart is empty.' mod='paggi'}</p>
    {else}

        <div class="box card" style="padding: 20px">

            <form class="paggi" action="{$link->getModuleLink('paggi', 'card', [], true)|escape:'html'}" method="post"  >
                <div class="row">

                    <div class="col-xs-12 col-sm-6">
                        <h3 class="page-subheading">{l s='Add Credit Card' mod='paggi'}</h3>


                        <div class="form_content clearfix">				
                            <div class="row">
                                <div class="col-xs-12 col-sm-12">
                                    <div class="card-wrapper"></div>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-xs-12 col-sm-8">
                                    <div class="form-group card_number">

                                        <label for="card_number">{l s='Credit card number'}</label>
                                        <div class="input-group">
                                            <span class="input-group-addon" 
                                                  >

                                                <span class="fa fa-credit-card" aria-hidden="true"></span>



                                            </span>
                                            <input type="text" 
                                                   placeholder="•••• •••• •••• ••••" 
                                                   id="card_number"
                                                   class="is_required validate form-control" name="PAGGI_CARD_NUMBER" />
                                        </div>
                                    </div>
                                </div>

                                <div class="col-xs-12 col-sm-4">
                                    <div class="form-group">

                                        <label for="expiration">{l s='Card expiration'}</label>
                                        <div class="input-group">
                                            <span class="input-group-addon">
                                                <span class="fa fa-calendar" aria-hidden="true"></span>
                                            </span>
                                            <input type="text" id="expiration" 
                                                   placeholder="•• / ••••" 
                                                   size="7" 
                                                   class="is_required validate form-control" name="PAGGI_CARD_EXPIRATE" />
                                        </div>


                                    </div>
                                </div>


                            </div>


                            <div class="row">
                                <div class="col-xs-12 col-sm-8">
                                    <div class="form-group">
                                        <label for="cardholder_name">{l s='Cardholder Name'}</label>
                                        <div class="input-group">
                                            <span class="input-group-addon">
                                                <span class="fa fa-user" aria-hidden="true"></span>
                                            </span>
                                            <input type="text" id="cardholder_name"
                                                   class="is_required validate form-control" name="PAGGI_CARD_HOLDER_NAME" />
                                        </div>
                                    </div>
                                </div>	


                                <div class="col-xs-12 col-sm-4">
                                    <div class="form-group">
                                        <label for="cvc">{l s='CVC'}</label>
                                        <input type="text" 
                                               placeholder="•••" 
                                               id="cvc"
                                               class="is_required validate form-control" name="PAGGI_CARD_CVC" />

                                    </div>
                                </div>						

                            </div>

                        </div>
                    </div>


                </div>
                <div class="row">
                    <div class="col-xs-12 col-sm-12">
                        <div class="submit">

                            <button 
                                class="btn btn-success button button-medium " 
                                type="submit" 
                                name="PAGGI_TASK_CARD" 
                                value="PAGGI_OK"
                                >
                                <span>
                                    {l s='Add Card' mod='paggi'}
                                </span>
                            </button>


                            <a href="{$link->getPageLink('order', true, NULL, "step=3")|escape:'html'}" class="btn btn-default button button-medium exclusive">
                                <span>
                                    {l s='Other payment methods' mod='paggi'}
                                </span>
                            </a>
                        </div>
                    </div>
                </div>
            </form>

        </div>

        </br>

        <script type="text/javascript">
            window.mask_name = "{l s='Full Name'}";

        </script>

    {/if}

{/block}