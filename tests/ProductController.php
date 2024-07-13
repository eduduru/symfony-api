<?php
// tests/Controller/ProductControllerTest.php
namespace App\Tests\Controller;

use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

class ProductControllerTest extends WebTestCase
{
    public function testIndex()
    {
        $client = static::createClient();
        $client->request('GET', '/api/products');

        $this->assertEquals(200, $client->getResponse()->getStatusCode());
    }

    // Additional tests for other endpoints...
}
